class FloorplansController < ApplicationController
  def index
    @floorplans = Floorplan.all
  end

  def show
    @floorplan = Floorplan.find(params[:id])
  end

  def new
    @floorplan = Floorplan.new
  end

  def create
    @floorplan = Floorplan.new
    @floorplan.image = params[:image]
    @floorplan.client_approved = params[:client_approved]
    @floorplan.project_id = params[:project_id]
    for_rerouting = params[:project_id]

    if @floorplan.save
      redirect_to "/projects/#{for_rerouting}", :notice => "Floorplan created successfully."
    else
      render 'new'
    end
  end

  def edit
    @floorplan = Floorplan.find(params[:id])
  end

  def update
    @floorplan = Floorplan.find(params[:id])

    @floorplan.image = params[:image]
    @floorplan.client_approved = params[:client_approved]
    @floorplan.project_id = params[:project_id]

    if @floorplan.save
      redirect_to request.referrer, :notice => "Floorplan updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @floorplan = Floorplan.find(params[:id])

    @floorplan.destroy

    redirect_to request.referrer, :notice => "Floorplan deleted."
  end

  def approve_floorplan
    @floorplan = Floorplan.find(params[:id])
    @floorplan.client_approved = true
    @floorplan.save

    redirect_to request.referrer, :notice => "Floorplan approved."
  end

  def revoke_approval
    @floorplan = Floorplan.find(params[:id])
    @floorplan.client_approved = false
    @floorplan.save

    redirect_to request.referrer, :notice => "Approval revoked."
  end
end
