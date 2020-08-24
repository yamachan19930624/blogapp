class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_one  :profile, dependent: :destroy
  has_many :likes, dependent: :destroy

  delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  def has_written?(article) 
    articles.exists?(id: article.id)
  end

  def display_name
    # if profile && profile.nikname
    #   profile.nickname
    # else
    #   self.email.split('@').first
    # end

    # ボッチ演算子
    profile&.nickname || self.email.split('@').first
  end

  # def birthday
  #   profile&.birthday
  # end

  # def gender
  #   profile&. gender
  # end

  def prepare_profile
    profile || bulid_profile
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end
end
