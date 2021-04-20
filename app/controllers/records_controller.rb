class RecordsController < ApplicationController
  before_action :authorized
  before_action :set_record, only: %i[show update destroy]

  def index
    @records = @current_user.records.order_by_date.joins(:item).select('
      records.id,
      records.user_id,
      item_id,
      date,
      result,
      items.title AS item_title,
      items.unit AS item_unit,
      items.icon AS item_icon,
      items.target AS target
      ')

    @record_dates = @current_user.records.order_by_date.map(&:date).uniq
    # @featured_result = @current_user.records.order_by_date.map { |record| [record.date, record.result] }

    if @records
      render json: { records: @records, record_dates: @record_dates }, status: 200
    else
      render json: 'No records yet'
    end
  end

  def show
    if @record
      render json: @record, status: 200
    else
      render json: { error: 'Record not found' }, status: 404
    end
  end

  def create
    @record = logged_in_user.records.new(record_params)

    if @record.save
      render json: @record, status: 200
    else
      render json: { error: 'Track could not be created.' }, status: 404
    end
  end

  def update
    if @record.update(record_params)
      render json: @record, status: 200
    else
      render json: { error: 'Track could not be updated.' }, status: 404
    end
  end

  def destroy
    if @record
      @record.destory
      render json: { message: 'Successfully deleted', deleted_record: @record }, status: 200
    else
      render json: { error: 'Sorry, Record could not be deleted' }, status: 404
    end
  end

  private

  def set_record
    # @record = Record.find(params[:id])
    @record = user.records.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:result, :item_id, :date)
  end
end
