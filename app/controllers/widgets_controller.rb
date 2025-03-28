class WidgetsController < ApplicationController
  rate_limit to: 4, within: 1.minute

  before_action :set_widget, only: %i[ show edit update destroy ]

  # GET /widgets or /widgets.json
  def index
    @widgets = Widget.all
  end

  # GET /widgets/1 or /widgets/1.json
  def show
  end

  # GET /widgets/new
  def new
    @widget = Widget.new
  end

  # GET /widgets/1/edit
  def edit
  end

  # POST /widgets or /widgets.json
  def create
    @widget = Widget.new(widget_params)

    respond_to do |format|
      if @widget.save
        format.html { redirect_to @widget, notice: "Widget was successfully created." }
        format.json { render :show, status: :created, location: @widget }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /widgets/1 or /widgets/1.json
  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to @widget, notice: "Widget was successfully updated." }
        format.json { render :show, status: :ok, location: @widget }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1 or /widgets/1.json
  def destroy
    @widget.destroy!

    respond_to do |format|
      format.html { redirect_to widgets_path, status: :see_other, notice: "Widget was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      @widget = Widget.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def widget_params
      params.expect(widget: [ :name, :description ])
    end
end
