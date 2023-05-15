//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Francesco Merola on 05/04/23.
//

import Foundation

// MARK: - PokemonDetail

struct PokemonDetail: Codable {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Species]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [JSONAny]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let pastTypes: [JSONAny]
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }
}

// MARK: PokemonDetail convenience initializers and mutators

extension PokemonDetail {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PokemonDetail.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        abilities: [Ability]? = nil,
        baseExperience: Int? = nil,
        forms: [Species]? = nil,
        gameIndices: [GameIndex]? = nil,
        height: Int? = nil,
        heldItems: [JSONAny]? = nil,
        id: Int? = nil,
        isDefault: Bool? = nil,
        locationAreaEncounters: String? = nil,
        moves: [Move]? = nil,
        name: String? = nil,
        order: Int? = nil,
        pastTypes: [JSONAny]? = nil,
        species: Species? = nil,
        sprites: Sprites? = nil,
        stats: [Stat]? = nil,
        types: [TypeElement]? = nil,
        weight: Int? = nil
    ) -> PokemonDetail {
        return PokemonDetail(
            abilities: abilities ?? self.abilities,
            baseExperience: baseExperience ?? self.baseExperience,
            forms: forms ?? self.forms,
            gameIndices: gameIndices ?? self.gameIndices,
            height: height ?? self.height,
            heldItems: heldItems ?? self.heldItems,
            id: id ?? self.id,
            isDefault: isDefault ?? self.isDefault,
            locationAreaEncounters: locationAreaEncounters ?? self.locationAreaEncounters,
            moves: moves ?? self.moves,
            name: name ?? self.name,
            order: order ?? self.order,
            pastTypes: pastTypes ?? self.pastTypes,
            species: species ?? self.species,
            sprites: sprites ?? self.sprites,
            stats: stats ?? self.stats,
            types: types ?? self.types,
            weight: weight ?? self.weight
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Ability
struct Ability: Codable, Identifiable {
    
    var id = UUID()
    
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: Ability convenience initializers and mutators

extension Ability {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ability.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        ability: Species? = nil,
        isHidden: Bool? = nil,
        slot: Int? = nil
    ) -> Ability {
        return Ability(
            ability: ability ?? self.ability,
            isHidden: isHidden ?? self.isHidden,
            slot: slot ?? self.slot
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: Species convenience initializers and mutators

extension Species {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Species.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        url: String? = nil
    ) -> Species {
        return Species(
            name: name ?? self.name,
            url: url ?? self.url
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GameIndex
struct GameIndex: Codable {
    let gameIndex: Int
    let version: Species

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

// MARK: GameIndex convenience initializers and mutators

extension GameIndex {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GameIndex.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        gameIndex: Int? = nil,
        version: Species? = nil
    ) -> GameIndex {
        return GameIndex(
            gameIndex: gameIndex ?? self.gameIndex,
            version: version ?? self.version
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Move
struct Move: Codable, Identifiable {
    
    var id = UUID()
    
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: Move convenience initializers and mutators

extension Move {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Move.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        move: Species? = nil,
        versionGroupDetails: [VersionGroupDetail]? = nil
    ) -> Move {
        return Move(
            move: move ?? self.move,
            versionGroupDetails: versionGroupDetails ?? self.versionGroupDetails
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: VersionGroupDetail convenience initializers and mutators

extension VersionGroupDetail {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(VersionGroupDetail.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        levelLearnedAt: Int? = nil,
        moveLearnMethod: Species? = nil,
        versionGroup: Species? = nil
    ) -> VersionGroupDetail {
        return VersionGroupDetail(
            levelLearnedAt: levelLearnedAt ?? self.levelLearnedAt,
            moveLearnMethod: moveLearnMethod ?? self.moveLearnMethod,
            versionGroup: versionGroup ?? self.versionGroup
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GenerationV
struct GenerationV: Codable {
    let blackWhite: Sprites

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: GenerationV convenience initializers and mutators

extension GenerationV {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenerationV.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        blackWhite: Sprites? = nil
    ) -> GenerationV {
        return GenerationV(
            blackWhite: blackWhite ?? self.blackWhite
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

// MARK: GenerationIv convenience initializers and mutators

extension GenerationIv {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenerationIv.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        diamondPearl: Sprites? = nil,
        heartgoldSoulsilver: Sprites? = nil,
        platinum: Sprites? = nil
    ) -> GenerationIv {
        return GenerationIv(
            diamondPearl: diamondPearl ?? self.diamondPearl,
            heartgoldSoulsilver: heartgoldSoulsilver ?? self.heartgoldSoulsilver,
            platinum: platinum ?? self.platinum
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Versions
struct Versions: Codable {
    let generationI: GenerationI
    let generationIi: GenerationIi
    let generationIii: GenerationIii
    let generationIv: GenerationIv
    let generationV: GenerationV
    let generationVi: [String: Home]
    let generationVii: GenerationVii
    let generationViii: GenerationViii

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: Versions convenience initializers and mutators

extension Versions {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Versions.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        generationI: GenerationI? = nil,
        generationIi: GenerationIi? = nil,
        generationIii: GenerationIii? = nil,
        generationIv: GenerationIv? = nil,
        generationV: GenerationV? = nil,
        generationVi: [String: Home]? = nil,
        generationVii: GenerationVii? = nil,
        generationViii: GenerationViii? = nil
    ) -> Versions {
        return Versions(
            generationI: generationI ?? self.generationI,
            generationIi: generationIi ?? self.generationIi,
            generationIii: generationIii ?? self.generationIii,
            generationIv: generationIv ?? self.generationIv,
            generationV: generationV ?? self.generationV,
            generationVi: generationVi ?? self.generationVi,
            generationVii: generationVii ?? self.generationVii,
            generationViii: generationViii ?? self.generationViii
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let backDefault: String
    let backFemale: JSONNull?
    let backShiny: String
    let backShinyFemale: JSONNull?
    let frontDefault: String
    let frontFemale: JSONNull?
    let frontShiny: String
    let frontShinyFemale: JSONNull?
    let other: Other?
    let versions: Versions?
    let animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, versions, animated
    }

    init(backDefault: String, backFemale: JSONNull?, backShiny: String, backShinyFemale: JSONNull?, frontDefault: String, frontFemale: JSONNull?, frontShiny: String, frontShinyFemale: JSONNull?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: Sprites convenience initializers and mutators

extension Sprites {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Sprites.self, from: data)
        self.init(backDefault: me.backDefault, backFemale: me.backFemale, backShiny: me.backShiny, backShinyFemale: me.backShinyFemale, frontDefault: me.frontDefault, frontFemale: me.frontFemale, frontShiny: me.frontShiny, frontShinyFemale: me.frontShinyFemale, other: me.other, versions: me.versions, animated: me.animated)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        backDefault: String? = nil,
        backFemale: JSONNull?? = nil,
        backShiny: String? = nil,
        backShinyFemale: JSONNull?? = nil,
        frontDefault: String? = nil,
        frontFemale: JSONNull?? = nil,
        frontShiny: String? = nil,
        frontShinyFemale: JSONNull?? = nil,
        other: Other?? = nil,
        versions: Versions?? = nil,
        animated: Sprites?? = nil
    ) -> Sprites {
        return Sprites(
            backDefault: backDefault ?? self.backDefault,
            backFemale: backFemale ?? self.backFemale,
            backShiny: backShiny ?? self.backShiny,
            backShinyFemale: backShinyFemale ?? self.backShinyFemale,
            frontDefault: frontDefault ?? self.frontDefault,
            frontFemale: frontFemale ?? self.frontFemale,
            frontShiny: frontShiny ?? self.frontShiny,
            frontShinyFemale: frontShinyFemale ?? self.frontShinyFemale,
            other: other ?? self.other,
            versions: versions ?? self.versions,
            animated: animated ?? self.animated
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GenerationI
struct GenerationI: Codable {
    let redBlue, yellow: RedBlue

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

// MARK: GenerationI convenience initializers and mutators

extension GenerationI {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenerationI.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        redBlue: RedBlue? = nil,
        yellow: RedBlue? = nil
    ) -> GenerationI {
        return GenerationI(
            redBlue: redBlue ?? self.redBlue,
            yellow: yellow ?? self.yellow
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - RedBlue
struct RedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String
    let frontGray, frontTransparent: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }
}

// MARK: RedBlue convenience initializers and mutators

extension RedBlue {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RedBlue.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        backDefault: String? = nil,
        backGray: String? = nil,
        backTransparent: String? = nil,
        frontDefault: String? = nil,
        frontGray: String? = nil,
        frontTransparent: String? = nil
    ) -> RedBlue {
        return RedBlue(
            backDefault: backDefault ?? self.backDefault,
            backGray: backGray ?? self.backGray,
            backTransparent: backTransparent ?? self.backTransparent,
            frontDefault: frontDefault ?? self.frontDefault,
            frontGray: frontGray ?? self.frontGray,
            frontTransparent: frontTransparent ?? self.frontTransparent
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    let crystal: Crystal
    let gold, silver: Gold
}

// MARK: GenerationIi convenience initializers and mutators

extension GenerationIi {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenerationIi.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        crystal: Crystal? = nil,
        gold: Gold? = nil,
        silver: Gold? = nil
    ) -> GenerationIi {
        return GenerationIi(
            crystal: crystal ?? self.crystal,
            gold: gold ?? self.gold,
            silver: silver ?? self.silver
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Crystal
struct Crystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }
}

// MARK: Crystal convenience initializers and mutators

extension Crystal {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Crystal.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        backDefault: String? = nil,
        backShiny: String? = nil,
        backShinyTransparent: String? = nil,
        backTransparent: String? = nil,
        frontDefault: String? = nil,
        frontShiny: String? = nil,
        frontShinyTransparent: String? = nil,
        frontTransparent: String? = nil
    ) -> Crystal {
        return Crystal(
            backDefault: backDefault ?? self.backDefault,
            backShiny: backShiny ?? self.backShiny,
            backShinyTransparent: backShinyTransparent ?? self.backShinyTransparent,
            backTransparent: backTransparent ?? self.backTransparent,
            frontDefault: frontDefault ?? self.frontDefault,
            frontShiny: frontShiny ?? self.frontShiny,
            frontShinyTransparent: frontShinyTransparent ?? self.frontShinyTransparent,
            frontTransparent: frontTransparent ?? self.frontTransparent
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Gold
struct Gold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }
}

// MARK: Gold convenience initializers and mutators

extension Gold {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Gold.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        backDefault: String? = nil,
        backShiny: String? = nil,
        frontDefault: String? = nil,
        frontShiny: String? = nil,
        frontTransparent: String?? = nil
    ) -> Gold {
        return Gold(
            backDefault: backDefault ?? self.backDefault,
            backShiny: backShiny ?? self.backShiny,
            frontDefault: frontDefault ?? self.frontDefault,
            frontShiny: frontShiny ?? self.frontShiny,
            frontTransparent: frontTransparent ?? self.frontTransparent
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    let emerald: OfficialArtwork
    let fireredLeafgreen, rubySapphire: Gold

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: GenerationIii convenience initializers and mutators

extension GenerationIii {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenerationIii.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        emerald: OfficialArtwork? = nil,
        fireredLeafgreen: Gold? = nil,
        rubySapphire: Gold? = nil
    ) -> GenerationIii {
        return GenerationIii(
            emerald: emerald ?? self.emerald,
            fireredLeafgreen: fireredLeafgreen ?? self.fireredLeafgreen,
            rubySapphire: rubySapphire ?? self.rubySapphire
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: OfficialArtwork convenience initializers and mutators

extension OfficialArtwork {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(OfficialArtwork.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        frontDefault: String? = nil,
        frontShiny: String? = nil
    ) -> OfficialArtwork {
        return OfficialArtwork(
            frontDefault: frontDefault ?? self.frontDefault,
            frontShiny: frontShiny ?? self.frontShiny
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Home
struct Home: Codable {
    let frontDefault: String
    let frontFemale: JSONNull?
    let frontShiny: String
    let frontShinyFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: Home convenience initializers and mutators

extension Home {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Home.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        frontDefault: String? = nil,
        frontFemale: JSONNull?? = nil,
        frontShiny: String? = nil,
        frontShinyFemale: JSONNull?? = nil
    ) -> Home {
        return Home(
            frontDefault: frontDefault ?? self.frontDefault,
            frontFemale: frontFemale ?? self.frontFemale,
            frontShiny: frontShiny ?? self.frontShiny,
            frontShinyFemale: frontShinyFemale ?? self.frontShinyFemale
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    let icons: DreamWorld
    let ultraSunUltraMoon: Home

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: GenerationVii convenience initializers and mutators

extension GenerationVii {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenerationVii.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        icons: DreamWorld? = nil,
        ultraSunUltraMoon: Home? = nil
    ) -> GenerationVii {
        return GenerationVii(
            icons: icons ?? self.icons,
            ultraSunUltraMoon: ultraSunUltraMoon ?? self.ultraSunUltraMoon
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String
    let frontFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: DreamWorld convenience initializers and mutators

extension DreamWorld {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DreamWorld.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        frontDefault: String? = nil,
        frontFemale: JSONNull?? = nil
    ) -> DreamWorld {
        return DreamWorld(
            frontDefault: frontDefault ?? self.frontDefault,
            frontFemale: frontFemale ?? self.frontFemale
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    let icons: DreamWorld
}

// MARK: GenerationViii convenience initializers and mutators

extension GenerationViii {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenerationViii.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        icons: DreamWorld? = nil
    ) -> GenerationViii {
        return GenerationViii(
            icons: icons ?? self.icons
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
    }
}

// MARK: Other convenience initializers and mutators

extension Other {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Other.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        dreamWorld: DreamWorld? = nil,
        home: Home? = nil,
        officialArtwork: OfficialArtwork? = nil
    ) -> Other {
        return Other(
            dreamWorld: dreamWorld ?? self.dreamWorld,
            home: home ?? self.home,
            officialArtwork: officialArtwork ?? self.officialArtwork
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: Stat convenience initializers and mutators

extension Stat {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Stat.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        baseStat: Int? = nil,
        effort: Int? = nil,
        stat: Species? = nil
    ) -> Stat {
        return Stat(
            baseStat: baseStat ?? self.baseStat,
            effort: effort ?? self.effort,
            stat: stat ?? self.stat
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Species
}

// MARK: TypeElement convenience initializers and mutators

extension TypeElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TypeElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        slot: Int? = nil,
        type: Species? = nil
    ) -> TypeElement {
        return TypeElement(
            slot: slot ?? self.slot,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

