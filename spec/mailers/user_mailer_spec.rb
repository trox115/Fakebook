# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'welcome' do
    user = FactoryBot.build(:user)
    let(:mail) { UserMailer.welcome(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to Fakebook')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['noreply@fakebook.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
