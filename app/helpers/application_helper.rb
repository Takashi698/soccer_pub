module ApplicationHelper
  def resource_name
      :user
  end

  def resource
      @resource ||= User.new
  end

  def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
  end

  # def text_placeholder
  # <<-"EOS".strip_heredoc
  #     タグをつけることができます。
  #     複数つけたい場合は' , 'で区切ってください。
  #     EOS
  # end
end
