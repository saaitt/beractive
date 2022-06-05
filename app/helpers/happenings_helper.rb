require 'nokogiri'
require 'json'
require 'open-uri'


module HappeningsHelper
    class HappeningsGatherer
        def initialize()
            @coberlin_event_manager = CoberlinEvent.new()
            @bargahin_event_manager = BargahinEvent.new()
        end

        def gatherHappenings()
            coberlin_events = @coberlin_event_manager.getCoBerlinEvents()
            bargahin_events = @bargahin_event_manager.getBerghainEvents()

            events = coberlin_events + bargahin_events

            return events
        end
    end

    class Happening 
        def initialize(title, subtitle, category, happening_at, web_source, url)
            @title = title
            @subtitle = subtitle
            @category = category
            @happening_at = happening_at
            @web_source = web_source
            @url = url
        end
    end

    class CoberlinEvent
        def initialize()
        end

        def getCoBerlinEvents()
            url='https://co-berlin.org/en/program/calendar'
            doc = Nokogiri::HTML(URI.open(url))
        
            events = doc.css('.view-content .views-row')
            happenings = []

            events.map do |event|
                link_to_event = event.children[1].children[1].attributes.first[1].value
                date = event.children[1].children[1].children[1].children[1].children[3].children[1].text.strip
                title = event.children[1].children[1].children[1].children[1].children[3].children[3].text.strip
                subtitle = event.children[1].children[1].children[1].children[1].children[3].children[5].text.strip
                category = event.children[1].children[1].children[1].children[1].children[3].children[7].text.strip

                happenings.push(Happening.new(title, subtitle, category, date.to_datetime, 'co-berlin.org', "https://coberlin.org#{link_to_event}"))
            end

            return happenings
        end
    end

    class BargahinEvent

        def initialize()
        end

        def getBerghainEvents()
            url = 'https://www.berghain.berlin/en/program/'
            doc = Nokogiri::HTML(URI.open(url))
            events = doc.css('.upcoming-event')
            happenings = []

            events.map do |event|
                link_to_event = event.attributes.first[1].value
                date = event.children[1].children[1].text.strip
                # time = event.children[1].children[2].text.strip
                # because on aggregation we only keep the corresponding data and the coberlin website doesnt have the time param so i just wont use the time param in here.
                title = event.children[3].text.strip

                for i in 5..event.children.length-1 do
                    if event.children[i].name == 'h3'
                        place = event.children[i].text.strip
                        if event.children[i+2].name == 'h4'
                            subtitle = event.children[i+2].text.strip.gsub("\n",'')
                            happenings.push(Happening.new(title, subtitle, place, date.to_datetime, 'berghain.berlin', "https://www.berghain.berlin#{link_to_event}"))
                        end
                    end
                end

            end
            return happenings
        end
        
    end

end
