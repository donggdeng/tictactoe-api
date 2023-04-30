class MovesController < JSONAPI::ResourceController
  skip_before_action :verify_authenticity_token

  def create
    @game = Game.find(params[:data][:relationships][:game][:data][:id])
    @move = @game.moves.build(position: params[:data][:attributes][:position], player: @game.next_player)

    if @move.save
      render json: serialize(@move), status: :created
    else
      render json: @move.errors, status: :unprocessable_entity
    end
  end

  private

  def serialize(move)
    JSONAPI::ResourceSerializer.new(MoveResource).serialize_to_hash(MoveResource.new(move, nil))
  end
end
