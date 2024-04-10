# frozen_string_literal: true

require_relative "urlextractor/version"

module Urlextractor
    class Error < StandardError; end
        # Your code goes here...
    def self.protocol input
        output = ""
        output = input[0, input.index(':')]
        output
    end
    
    def self.domain(url)
        url.match(/(?:https?:\/\/)?(?:www\.)?([^\/]+)/)[1] || ''
    end
    
    def self.extension(url)
        domain = self.domain(url)
        domain.split('.').last || ''
    end
    
    def self.path(url)
        url.match(/https?:\/\/(?:www\.)?.+?(\/.*)/)[1] || ''
    end
    
    def self.query_params(url)
        query_string = url.match(/\?(.*)/)[1]
        query_string.split('&').map { |pair| pair.split('=') }.to_h
    end
end
