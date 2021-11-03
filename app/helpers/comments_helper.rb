# frozen_string_literal: true

# module CommentsHelper
module CommentsHelper
  STATUS = {
    success: 'px-4 py-3 leading-normal text-blue-700 border border-blue-500 rounded-lg',
    error: 'px-4 py-3 leading-normal text-red-700 border border-red-500 rounded-lg',
    info: 'px-4 py-3 leading-normal text-gren-700 border border-green-500 rounded-lg'
  }.freeze

  def notice_comment_stream(message:, status:)
    turbo_stream.append :notice_comment, partial: 'shared/notice', locals: { notice: message, status: STATUS[status] }
  end
end
