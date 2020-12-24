/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GuestReviewOverview : Codable {
	let totalCount : Int?
	let overall : Double?
	let formattedOverall : String?
	let overallScoreBreakdown : [OverallScoreBreakdown]?
	let qualitativeBadgeText : String?
	let hotelService : Double?
	let roomComfort : Double?
	let hotelCondition : Double?
	let cleanliness : Double?
	let neighbourhood : Double?
	let formattedHotelService : String?
	let formattedRoomComfort : String?
	let formattedHotelCondition : String?
	let formattedCleanliness : String?
	let formattedNeighbourhood : String?

	enum CodingKeys: String, CodingKey {

		case totalCount = "totalCount"
		case overall = "overall"
		case formattedOverall = "formattedOverall"
		case overallScoreBreakdown = "overallScoreBreakdown"
		case qualitativeBadgeText = "qualitativeBadgeText"
		case hotelService = "hotelService"
		case roomComfort = "roomComfort"
		case hotelCondition = "hotelCondition"
		case cleanliness = "cleanliness"
		case neighbourhood = "neighbourhood"
		case formattedHotelService = "formattedHotelService"
		case formattedRoomComfort = "formattedRoomComfort"
		case formattedHotelCondition = "formattedHotelCondition"
		case formattedCleanliness = "formattedCleanliness"
		case formattedNeighbourhood = "formattedNeighbourhood"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
		overall = try values.decodeIfPresent(Double.self, forKey: .overall)
		formattedOverall = try values.decodeIfPresent(String.self, forKey: .formattedOverall)
		overallScoreBreakdown = try values.decodeIfPresent([OverallScoreBreakdown].self, forKey: .overallScoreBreakdown)
		qualitativeBadgeText = try values.decodeIfPresent(String.self, forKey: .qualitativeBadgeText)
		hotelService = try values.decodeIfPresent(Double.self, forKey: .hotelService)
		roomComfort = try values.decodeIfPresent(Double.self, forKey: .roomComfort)
		hotelCondition = try values.decodeIfPresent(Double.self, forKey: .hotelCondition)
		cleanliness = try values.decodeIfPresent(Double.self, forKey: .cleanliness)
		neighbourhood = try values.decodeIfPresent(Double.self, forKey: .neighbourhood)
		formattedHotelService = try values.decodeIfPresent(String.self, forKey: .formattedHotelService)
		formattedRoomComfort = try values.decodeIfPresent(String.self, forKey: .formattedRoomComfort)
		formattedHotelCondition = try values.decodeIfPresent(String.self, forKey: .formattedHotelCondition)
		formattedCleanliness = try values.decodeIfPresent(String.self, forKey: .formattedCleanliness)
		formattedNeighbourhood = try values.decodeIfPresent(String.self, forKey: .formattedNeighbourhood)
	}

}