require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ThingController < Rho::RhoController
  include BrowserHelper

  #GET /Thing
  def index
    @things = Thing.find(:all)
    render
  end

  # GET /Thing/{1}
  def show
    @thing = Thing.find(@params['id'])
    if @thing
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Thing/new
  def new
    @thing = Thing.new
    render :action => :new
  end

  # GET /Thing/{1}/edit
  def edit
    @thing = Thing.find(@params['id'])
    if @thing
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Thing/create
  def create
    @thing = Thing.new(@params['thing'])
    @thing.save
    redirect :action => :index
  end

  # POST /Thing/{1}/update
  def update
    @thing = Thing.find(@params['id'])
    @thing.update_attributes(@params['thing']) if @thing
    redirect :action => :index
  end

  # POST /Thing/{1}/delete
  def delete
    @thing = Thing.find(@params['id'])
    @thing.destroy if @thing
    redirect :action => :index
  end
end
