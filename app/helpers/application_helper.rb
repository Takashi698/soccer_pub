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

  def sidebar_link_item(name, path)
    class_name = 'channel'
    class_name << ' active' if current_page?(path)

    content_tag :li, class:class_name do
      link_to name, path, class: 'channel_name'
    end
  end

  # def text_placeholder
  # <<-"EOS".strip_heredoc
  #     タグをつけることができます。
  #     複数つけたい場合は' , 'で区切ってください。
  #     EOS
  # end
end
