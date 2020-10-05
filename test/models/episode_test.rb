require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should save with a number' do
    episode = episodes(:one)
    assert episode.save
  end

  test 'should not save without number' do
    episode = Episode.new
    assert_not episode.save
  end

  test 'should not save a duplicate episode' do
    episode = Episode.new(number: 'S01E01')
    assert_not episode.save, 'Saved a duplicate episode number'
  end
end
