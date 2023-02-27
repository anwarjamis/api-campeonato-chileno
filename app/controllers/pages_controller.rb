require 'open-uri'
require 'nokogiri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home update]

  def home
  end

  def update
    list = positions_list
    sub_arrays = list.each_slice(10).to_a
    sub_arrays.each do |team|
      Table.where(position: team[0]).first.update(club: team[1], points: team[2], played: team[3], won: team[4],
                                                  drawn: team[5], lost: team[6], gf: team[7], ga: team[8], gd: team[9])
    end
  end

  def positions_list
    html_file = URI.open('https://campeonatochileno.cl/estadisticas/campeonato-betsson').read
    html_doc = Nokogiri::HTML.parse(html_file)
    elements = html_doc.css('tbody tr td').map { |element| element.text.strip }
    list = []
    elements.each_with_index do |row, index|
      next if index % 11 == 10

      list << (index % 11 == 1 ? row : row.to_i)
    end
    return list
  end
end
