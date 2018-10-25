class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :images

  mount_uploader :picture, PictureUploader
  validate :picture_size

  def full_name
    return "#{first_name} #{last_name}".strip
  end

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

  def self.search(param)
    param.strip!
    param.downcase!
    to_send_back = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end

  # + nationality_matches(param) + height_matches(param) + bust_matches(param) + waist_matches(param) + 
  #     hips_matches(param) + hair_color_matches(param) + shoe_size_matches(param)

  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.nationality_matches(param)
    matches('nationality', param)
  end

  # def self.height_matches(param)
  #   matches('height', param)
  # end

  # def self.bust_matches(param)
  #   matches('bust', param)
  # end

  # def self.waist_matches(param)
  #   matches('waist', param)
  # end

  # def self.hips_matches(param)
  #   matches('hips', param)
  # end

  # def self.hair_color_matches(param)
  #   matches('hair_color', param)
  # end

  # def self.shoe_size_matches(param)
  #   matches('shoe_size', param)
  # end

  def self.matches(field_name, param)
    User.where("#{field_name} like ?", "%#{param}%")
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end
end
