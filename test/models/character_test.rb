require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should save with a name' do
    character = characters(:rick)
    assert character.save
  end

  test 'should not save without name' do
    character = Character.new
    assert_not character.save
  end

  test 'should not save a duplicate character' do
    character = Character.new(name: 'Rick Sanchez')
    assert_not character.save, 'Saved a duplicate character name'
  end

  test 'should get episodes for a given character' do
    character = characters(:rick)
    episodes = character.episodes
    expected = [episodes(:one), episodes(:two)]

    assert_equal expected, episodes
  end
end
