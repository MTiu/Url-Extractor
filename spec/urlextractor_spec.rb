# frozen_string_literal: true
require "spec_helper"

RSpec.describe Urlextractor do
    it "extracts the protocol part of the string url" do 
        expect(Urlextractor.protocol "https://hackerhero.com").to eq("https")
    end

    it "extracts the domain part of the string url" do
        expect(Urlextractor.domain "https://hackerhero.com").to eq("hackerhero.com")
        expect(Urlextractor.domain "https://hackerhero.com/groups").to eq("hackerhero.com")
    end

    it "extracts the extension" do
        expect(Urlextractor.extension "https://hackerhero.com").to eq("com")
    end

    it "extracts the remaining parts after domain" do
        expect(Urlextractor.path "https://www.hackerhero.com/groups/abc").to eq("/groups/abc")
        expect(Urlextractor.path "https://www.hackerhero.com/groups/abc/index.html").to eq("/groups/abc/index.html")
    end

    it "gets key-value pairs after the path" do
        expect(Urlextractor.query_params "https://www.hackerhero.com/groups?key1=value1&key2=value2").to eq({"key1"=>"value1", "key2"=>"value2"})
    end
end
