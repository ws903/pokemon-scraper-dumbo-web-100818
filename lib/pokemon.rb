class Pokemon
	attr_reader(:id, :name, :type, :db, :hp)

	def initialize(id:, name:, type:, db:, hp:nil)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp = ?", hp)
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id, db)
		db_result = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")
		Pokemon.new(id: db_result[0][0], name: db_result[0][1], type: db_result[0][2], db: db)
	end
end
