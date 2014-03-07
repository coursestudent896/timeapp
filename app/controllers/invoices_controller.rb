class InvoicesController < ApplicationController  

  def new
    @invoice = Invoice.new
  end

  def index
  end

  def edit
    if current_user
    @invoice = current_user.invoice
  end
 end


    def update
      @invoice = current_user.invoice
 
  if @invoice.update(invoice_params)
     @invoice.pay_due = @invoice.hourly_rate * @invoice.hours
      @invoice.update(invoice_params)
    redirect_to root_url, :notice => 'Invoice updated and your new pay due is ' + @invoice.pay_due.to_s
  else
    render 'edit'
  end

      end
    

  def create

    @invoice = Invoice.new(invoice_params)

    if @invoice.save 
      @invoice.pay_due = @invoice.hourly_rate * @invoice.hours
      @invoice.save

      redirect_to root_url, :notice => 'Invoice created and your pay due is ' + @invoice.pay_due.to_s
    else
      render :new, :notice => 'You could not create an invoice.'
    end
  end


    def show
      end

private
def invoice_params
  params.require(:invoice).permit(:name, :company, :hours, :hourly_rate, :user_id)
end

end
