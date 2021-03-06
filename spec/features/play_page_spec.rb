require_relative 'web_helpers'

feature 'allows user to visit play page which should display their name' do
  scenario 'user goes to play page and see\'s their name' do
    enter_name
    expect(page).to have_content "Ollie"
  end
end

feature 'correct outcome to game' do
  scenario 'if player selects rock and bot selects scissors then player wins' do
    allow_any_instance_of(Bot).to receive(:move).and_return('scissors')
    enter_name
    choose 'rock'
    click_button 'Submit'
    expect(page).to have_content 'Ollie wins!'
  end

  scenario 'if player selects scissors and bot selects paper then player wins' do
    allow_any_instance_of(Bot).to receive(:move).and_return('paper')
    enter_name
    choose 'scissors'
    click_button 'Submit'
    expect(page).to have_content 'Ollie wins!'
  end

  scenario 'if player selects rock and bot selects scissors then player wins' do
    allow_any_instance_of(Bot).to receive(:move).and_return('rock')
    enter_name
    choose 'paper'
    click_button 'Submit'
    expect(page).to have_content 'Ollie wins!'
  end

  scenario 'if player selects rock and bot selects paper then player loses' do
    allow_any_instance_of(Bot).to receive(:move).and_return('paper')
    enter_name
    choose 'rock'
    click_button 'Submit'
    expect(page).to have_content 'Ollie loses!'
  end

  scenario 'if player selects paper and bot selects scissors then player loses' do
    allow_any_instance_of(Bot).to receive(:move).and_return('scissors')
    enter_name
    choose 'paper'
    click_button 'Submit'
    expect(page).to have_content 'Ollie loses!'
  end

  scenario 'if player selects scissors and bot selects rock then player loses' do
    allow_any_instance_of(Bot).to receive(:move).and_return('rock')
    enter_name
    choose 'scissors'
    click_button 'Submit'
    expect(page).to have_content 'Ollie loses!'
  end

  scenario 'if player selects rock and bot selects rock then its a draw' do
    allow_any_instance_of(Bot).to receive(:move).and_return('rock')
    enter_name
    choose 'rock'
    click_button 'Submit'
    expect(page).to have_content 'It\'s a draw'
  end

  scenario 'if player selects paper and bot selects paper then its a draw' do
    allow_any_instance_of(Bot).to receive(:move).and_return('paper')
    enter_name
    choose 'paper'
    click_button 'Submit'
    expect(page).to have_content 'It\'s a draw'
  end

  scenario 'if player selects scissors and bot selects scissors then its a draw' do
    allow_any_instance_of(Bot).to receive(:move).and_return('scissors')
    enter_name
    choose 'scissors'
    click_button 'Submit'
    expect(page).to have_content 'It\'s a draw'
  end
end

feature 'allows user to play again' do
  scenario 'user plays a game and then clicks play again' do
    enter_name
    choose 'scissors'
    click_button 'Submit'
    click_button 'Play again?'
    expect(page).to have_content "Please select your weapon"
  end
end

feature 'no selection is made' do
  scenario 'user plays a game without choseing a weapon' do
    enter_name
    click_button 'Submit'
    expect(page).to have_content "muppet"
  end
end