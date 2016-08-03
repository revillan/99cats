class CatRentalsController < ApplicationController

  def new
    render :new
  end

  def create
    @cat_rental = CatRental.new(cat_rental_params)
    if @cat_rental.save
      cat_id = @cat_rental.cat_id
      @cat = Cat.find_by_id(cat_id)
      redirect_to cat_url(@cat)
      flash[:notice] = "cat rental request received"
    else
      flash[:notice] = "cat rental request not received, check inputs"
      render :new
    end
  end


  private
  def cat_rental_params
    params.require(:cat_rental).permit(:start_date, :end_date, :cat_id, :status)
  end
end
