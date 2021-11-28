# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  let!(:incomplete_todo) { create(:todo) }
  let!(:complete_todo) { create(:todo, :complete) }
  let!(:overdue_todo) { create(:todo, :overdue) }
  let!(:complete_overdue_todo) { create(:todo, :complete, :overdue) }

  # relationships
  it { is_expected.to belong_to(:user) }

  describe '.incomplete' do
    it 'returns the incomplete todos' do
      expect(described_class.incomplete).to match_array([incomplete_todo, overdue_todo])
    end
  end

  describe '.complete' do
    it 'returns the complete todos' do
      expect(described_class.complete).to match_array([complete_todo, complete_overdue_todo])
    end
  end

  describe '.overdue' do
    it 'returns the overdue todos because complete trumps overdue' do
      expect(described_class.overdue).to match_array([overdue_todo])
    end
  end

  describe '#complete!' do
    it 'populates the todos completed_at field' do
      incomplete_todo.complete!

      expect(incomplete_todo.completed_at).not_to be_nil
    end
  end
end
