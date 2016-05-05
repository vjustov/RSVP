class Registration < ActiveRecord::Base

  class EmailValidator < ActiveModel::Validator
    def validate(registration)
      if invalid_email?(registration)
        product.errors[:box] << "cannot be empty if product is cropped"
      end
    end

    private

    def invalid_email?
      !(registration.email =~ /[\w.-]+@[a-z]+\.[a-z]+/)
    end
  end

  belongs_to :event

  # validates_with EmailValidator
  # validates_uniqueness_of :email
  validates :email, uniqueness: true, format: { with: /[\w.-]+@[a-z]+\.[a-z]+/ }

  # enum events: [:ruby_do, :javascript_do]
end
