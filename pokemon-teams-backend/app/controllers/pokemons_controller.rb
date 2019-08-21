class PokemonsController < ApplicationController
    def create
        # binding.pry
        trainer = Trainer.find(pokemon_params[:trainer_id])
        
        if (trainer.pokemons.count < 6)
            pokemon = trainer.pokemons.build
            pokemon.nickname = Faker::Name.first_name
            pokemon.species = Faker::Games::Pokemon.name
            pokemon.save 

            redirect_to '/trainers'
        else
            redirect_to '/trainers'
        end

            # render json: PokemonSerializer.new(pokemon)
    end

    def destroy
        # binding.pry

        pokemon = Pokemon.find(params[:id])
        pokemon.delete

        redirect_to '/trainers'
    end


    private 

    def pokemon_params
        params.require(:pokemon).permit(:trainer_id)
    end
end
