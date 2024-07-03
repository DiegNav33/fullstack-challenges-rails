class User < ActiveRecord::Base
  has_many :posts

  # TODO: Add some validation
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/ }
  # TODO: Add some callbacks

  # Callback pour enlever les espaces blancs au début et à la fin de l'email
  before_validation :strip_whitespace_from_email

  # Callback après la création pour envoyer un email de bienvenue
  after_create :send_welcome_email

  private

  def strip_whitespace_from_email
    self.email = email.strip if email.present?
  end

  def send_welcome_email
    FakeMailer.instance.mail(email, "Welcome to Hacker News!")
  end
end
