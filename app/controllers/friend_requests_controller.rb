class FriendRequestsController < ApplicationController
  # GET /friend_requests
  # GET /friend_requests.json
  def index
    @friend_requests = FriendRequest.all
  end

  # GET /friend_requests/1
  # GET /friend_requests/1.json
  def show
    @friend_request = FriendRequest.find(params[:id])
  end

  # GET /friend_requests/new
  # GET /friend_requests/new.json
  def new
    @friend_request = FriendRequest.new
  end

  # GET /friend_requests/1/edit
  def edit
    @friend_request = FriendRequest.find(params[:id])
  end

  # POST /friend_requests
  # POST /friend_requests.json
  def create
    @friend_request = FriendRequest.new(params[:friend_request])
    @friend_request.ip_address = request.remote_ip

    respond_to do |format|
      if @friend_request.save
        format.html { redirect_to root_url, notice: '<p><strong>Your Request was successfully received</strong></p><p>...It will now be screened, processed, and delivered to Quinn</p><p>...Who will process it in quinn-time</p>' }
        format.json { render json: @friend_request, status: :created, location: @friend_request }
      else
        format.html { render action: "new" }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /friend_requests/1
  # PUT /friend_requests/1.json
  def update
    @friend_request = FriendRequest.find(params[:id])

    respond_to do |format|
      if @friend_request.update_attributes(params[:friend_request])
        format.html { redirect_to @friend_request, notice: 'Friend request was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_requests/1
  # DELETE /friend_requests/1.json
  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy

    respond_to do |format|
      format.html { redirect_to friend_requests_url }
      format.json { head :ok }
    end
  end
end
