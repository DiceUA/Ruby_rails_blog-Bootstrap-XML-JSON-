require 'rspec'
require 'spec_helper'
require 'rails_helper'


describe AstrologyController do
  # Need to make instance of controller to test his methods
  instance = AstrologyController.new
  it 'should show 1000' do
    expect(instance.test_me).to eq(1000)
  end

  it 'should get virgo sign' do
    expect(instance.choose_sign(30,8)).to eq('virgo')
  end

  it 'should NOT get virgo sign' do
    expect(instance.choose_sign(30,5)).not_to eq('virgo')
  end

  it 'should show horoscope' do
    # TODO: Install capybara make test with capybara
  end
end