class ContactsController < ApplicationController
	#Verifica si el usuario tiene sesión iniciada
	before_action :authenticate_user!
	before_action :set_contact , except: [:index, :new, :create]
	#GET /contacts
	def index
		#Obtiene los contactos que fueron creados por el usuario que tiene la sesión.
		@contacts = Contact.where(" user_id = ?" , current_user.id)
	end

	#GET /contacts/:id
	def show
	end

	#GET /contacts/new
	def new
		@contact = Contact.new
	end

	#POST /contacts
	def create
		@contact = current_user.contacts.new(contact_params)
		if @contact.save
			redirect_to @contact
		else
			render :new
		end
	end

	#DELETE "/contacts/:id"
	def destroy
		@contact.destroy #Destroy elimina el objeto de la base de datos
		redirect_to contacts_path
	end

	#PUT /contacts/:id
	def update
		if @contact.update(contact_params)
			redirect_to @contact
		else
			render :edit
		end
	end

	def edit
	end

	private
	def set_contact
		@contact = Contact.find(params[:id])
	end
	def contact_params
		params.require(:contact).permit(:name, :lastname , :email, :phone_1 , :phone_2 , :address , :web)
	end
	
end