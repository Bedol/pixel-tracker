class LinksController < ApplicationController
  def index
    @links = Link.last(10).order(created_at: :desc)
  end

  def show
    link = Link.find_by(owner_code: show_params[:owner_code], code: show_params[:code])

    render :not_found unless link

    Open.create(source: 'email', request_ip: request.remote_ip, link:)
    send_file Rails.root.join('public', '1x1.png'),
              type: 'image/png',
              disposition: 'inline'
  end

  def create
    owner_code = ENV.fetch('OWNER_CODE', 'test')
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
end
