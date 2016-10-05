require 'erb'
require 'csv'

class ProfileMaker

  attr_reader :profile_data, :template

  def initialize
    @profile_data = []
    @template = 'Template Missing'
  end

  def add_template(filepath)
    @template = File.read(filepath)
  end

  def add_profile_data(filepath)
    @profile_data = CSV.read(filepath)
  end

  def render
    ERB.new(@template).result(binding)
  end
end
