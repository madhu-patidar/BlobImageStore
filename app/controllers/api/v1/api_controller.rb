module Api
  module V1
    # Generic API stuff here in this class
    # TODO : Need to have a basic authentication to verify that
    # request cming from our app
    class ApiController < ApplicationController
      protect_from_forgery with: :null_session

      def params_missing?(params_array, keys_array)
        @error_hash = {}
        keys_array.each do |key|
          unless params_array[key].present?
            @error_hash[:message] = (@error_hash.has_key?(:message)) ? @error_hash[:message] + " #{key.to_s} parameter is missing." : "#{key.to_s} parameter is missing."
          end
        end

        @error_hash.merge!(error: "Bad Request") if @error_hash.has_key?(:message)
        @error_hash.has_key?(:message)
      end
    end
  end
end