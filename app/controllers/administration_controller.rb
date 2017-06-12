class AdministrationController < ApplicationController
  def index
  	@items=Administration.all
  end 


 def show
  
  	if@items=Administration.where(ApiKey: params[:ApiKey]).empty?
  		@items="Null"

  	else
  		
  		@numeros=params[:palabras].split(",")
  		@vector_posiciones= []  
  		@vector_palabras  = []
  		@lista_posiciones=[];
  		@iteraciones=@numeros.length-2

  		@contador=0
  		for dato in (0..@iteraciones)
  			for dato2 in (dato..@iteraciones)
  				if @numeros[dato]==@numeros[dato2+1]	
  					@vector_palabras [@contador]=[@numeros[dato],"{"+dato.to_s+","+(dato2+1).to_s+"}"]	
  					@vector_posiciones [@contador]="{"+dato.to_s+","+(dato2+1).to_s+"}";
  					#@lista_posiciones=@lista_posiciones+"{"+dato.to_s+","+(dato2+1).to_s+"}"
  					@contador=@contador+1
  			else

  				end		
  			end
		end
			

  		
  		@items=Administration.where(ApiKey: params[:ApiKey]).take
  		@items.update(num: @items.num+1)
  	end
  end


  def new
  	@items=Administration.new
  	
  end

  def create
 
  
  @correo=params[:administration][:correo];
  @ApiKey=Digest::MD5.hexdigest(params[:administration][:correo]);
  @num=0;

  #@items = Administration.new(params.require(:administration).permit(:correo, :ApiKey))
  @items = Administration.new({:correo=>@correo,:ApiKey=>@ApiKey,:num=>@num});
  if @items.save
  	redirect_to action: 'index', status: 303
  else
 	render :new
  end
  end


  

end
