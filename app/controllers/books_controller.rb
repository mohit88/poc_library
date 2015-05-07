class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :destroy]
  before_action :set_current_user, only: [:index, :show, :create, :edit, :update, :destroy, :return, :user_book]

  # GET /books
  # GET /books.json
  def index
    @books = params[:search] ? Book.select{|book| book.title.downcase.include?(params[:search].downcase)} : Book.all
  end

  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # POST /books
  # POST /books.json
  def create
    flash[:success] = 'Added new Book...!'
    redirect_to :new_user_book, {user_id: @current_user}
    # @book = Book.new(book_params)
    #
    # respond_to do |format|
    #   if @book.save
    #     format.html { redirect_to @book, notice: 'Book was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @book }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @book.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    flash[:success] = 'Added new Book...!'
    redirect_to :new_user_book, {user_id: @current_user}
  end

  def borrow
    flash[:success] = 'Book borrowed...!'
    redirect_to :user_book, {user_id: @current_user,id: params[:id]}
  end

  def return
    flash[:success] = 'Thanks for returning book .....'
    redirect_to :user_book_user_books, {user_id: @current_user}
  end

  def user_book
    @books = [Book.first]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_current_user
      @current_user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :author)
    end
end
