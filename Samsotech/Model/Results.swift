/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Results : Codable {
	let id : Int?
	let name : String?
	let thumbnailUrl : String?
	let starRating : Double?
	
	let address : Address?
	let welcomeRewards : WelcomeRewards?
	let guestReviews : GuestReviews?
	let landmarks : [Landmarks]?
	let ratePlan : RatePlan?
	let neighbourhood : String?
	let deals : Deals?

	let pimmsAttributes : String?
	let coordinate : Coordinate?
	let providerType : String?
	let supplierHotelId : Int?
	let isAlternative : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case thumbnailUrl = "thumbnailUrl"
		case starRating = "starRating"
		
		case address = "address"
		case welcomeRewards = "welcomeRewards"
		case guestReviews = "guestReviews"
		case landmarks = "landmarks"
		case ratePlan = "ratePlan"
		case neighbourhood = "neighbourhood"
		case deals = "deals"
		
		case pimmsAttributes = "pimmsAttributes"
		case coordinate = "coordinate"
		case providerType = "providerType"
		case supplierHotelId = "supplierHotelId"
		case isAlternative = "isAlternative"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
		starRating = try values.decodeIfPresent(Double.self, forKey: .starRating)
		
		address = try values.decodeIfPresent(Address.self, forKey: .address)
		welcomeRewards = try values.decodeIfPresent(WelcomeRewards.self, forKey: .welcomeRewards)
		guestReviews = try values.decodeIfPresent(GuestReviews.self, forKey: .guestReviews)
		landmarks = try values.decodeIfPresent([Landmarks].self, forKey: .landmarks)
		ratePlan = try values.decodeIfPresent(RatePlan.self, forKey: .ratePlan)
		neighbourhood = try values.decodeIfPresent(String.self, forKey: .neighbourhood)
		deals = try values.decodeIfPresent(Deals.self, forKey: .deals)
	
		pimmsAttributes = try values.decodeIfPresent(String.self, forKey: .pimmsAttributes)
		coordinate = try values.decodeIfPresent(Coordinate.self, forKey: .coordinate)
		providerType = try values.decodeIfPresent(String.self, forKey: .providerType)
		supplierHotelId = try values.decodeIfPresent(Int.self, forKey: .supplierHotelId)
		isAlternative = try values.decodeIfPresent(Bool.self, forKey: .isAlternative)
	}

}
