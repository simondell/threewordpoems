module PoemsHelper
  # <img alt="" src="poem/picture_480w.jpg"
  #   srcset="poem/picture_480w.jpg 480w,
  #           poem/picture_960w.jpg 960w,
  #           poem/picture_1920w.jpg 1920w"
  #   sizes="100%, (min-width=960) 960px" />
  def responsive_picture poem
    image_sizes = Rails.application.config.image_sizes
    default_url = poem.picture.handheld.url
    sizes = '100%, (min-width=960) 960px'
    srcset = []

    image_sizes.each do |device, width|
      srcset << "#{poem.picture.send(device).url} #{width}w"
    end

    image_tag default_url, alt:'', sizes: sizes, srcset: srcset.join(',')
  end
end
