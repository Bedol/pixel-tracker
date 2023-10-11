# frozen_string_literal: true

# Controller to handle links
class LinksController < ApplicationController
  before_action :set_link, only: %i[show glanced skimmed readed]

  def index
    @links = Link.order(created_at: :desc)
  end

  def show
    render :not_found unless @link

    Open.create(source: 'email', request_ip: request.remote_ip, open_type: :standard, link: @link,
                user_agent: request.headers['User-Agent'])
    redirect_to action: :glanced, status: 303, p: SecureRandom.uuid
  end

  def glanced
    render :not_found unless @link

    sleep 2
    Open.create(source: 'email', request_ip: request.remote_ip, open_type: :glanced, link: @link,
                user_agent: request.headers['User-Agent'])

    redirect_to action: :skimmed, status: 303, p: SecureRandom.uuid
  end

  def skimmed
    render :not_found unless @link

    sleep 6
    Open.create(source: 'email', request_ip: request.remote_ip, open_type: :skimmed, link: @link,
                user_agent: request.headers['User-Agent'])

    redirect_to action: :readed, status: 303, p: SecureRandom.uuid
  end

  def readed
    render :not_found unless @link

    sleep 2
    Open.create(source: 'email', request_ip: request.remote_ip, open_type: :readed, link: @link,
                user_agent: request.headers['User-Agent'])

    send_file Rails.root.join('public', '1x1.png'),
              type: 'image/png',
              disposition: 'inline'
  end

  def create
    owner_code = ENV.fetch('CODE_OWNER', 'test')
    code = SecureRandom.hex(8)
    @link = Link.new(owner_code:, code:)

    if @link.save
      render json: { status: 'OK', link: @link }, status: :created
    else
      render json: { status: 'Error' }, status: :bad_request
    end
  end

  private

  def show_params
    params.permit(:owner_code, :code)
  end

  def set_link
    @link = Link.find_by(owner_code: show_params[:owner_code], code: show_params[:code])
  end
end
