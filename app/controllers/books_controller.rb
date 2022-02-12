class BooksController < ApplicationController
  def new
  end

  def index
    
    @books =Book.all
    @book = Book.new 
    
    
  end
  
  
  def create
    
    @book = Book.new(list_params)
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully created."
    else
    @books =Book.all
    render :index
    end
  end
 
  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    flash[:notice]= "Book was successfully updated."
    if @book.update(list_params)
    redirect_to book_path(@book) 
    else
    render:edit
    end
    
  end
  def destroy
    book = Book.find(params[:id]) 
    book.destroy 
    flash[:notice]="Book was successfully destroyed."
    redirect_to books_path 
  end 
  
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
