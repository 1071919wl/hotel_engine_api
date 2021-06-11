# API source: https://breakingbadapi.com/documentation


class Api::CharactersController < ApplicationController

    def index
        @responses = HTTParty.get('https://www.breakingbadapi.com/api/characters/')

        if @responses.length > 0
            render json: @responses.parsed_response
        else
            render json: ["404 Page not found"], status: 404
        end

    end

    def show
        url = "https://www.breakingbadapi.com/api/characters/#{params[:id]}"

        @response = Character.find_by(id: params[:id])
        
        if @response
            render json: @response
        else
            
            @get_response = HTTParty.get(url)
            p @get_response
            if @get_response[0] != nil && @get_response.length > 0
                
                render json: @get_response[0]

                @get_response[0]
                newChar = Character.new()
                newChar.char_id = @get_response[0]["char_id"]
                newChar.name = @get_response[0]["name"]
                newChar.birthday = @get_response[0]["birthday"]
                newChar.occupation = @get_response[0]["occupation"]
                newChar.img = @get_response[0]["img"]
                newChar.status = @get_response[0]["status"]
                newChar.nickname = @get_response[0]["nickname"]
                newChar.appearance = @get_response[0]["appearance"]
                newChar.portrayed = @get_response[0]["portrayed"]
                newChar.category = @get_response[0]["category"]
                newChar.better_call_saul_appearance = @get_response[0]["better_call_saul_appearance"]
                
                #! newChar.save

            else
                render json: ["404 Page not found"], status: 404
            end
        end
        
    end

end
