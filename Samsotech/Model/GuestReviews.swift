/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GuestReviews : Codable {
	let unformattedRating : Double?
	let rating : String?
	let total : Int?
	let scale : Int?
	let badge : String?
	let badgeText : String?

	enum CodingKeys: String, CodingKey {

		case unformattedRating = "unformattedRating"
		case rating = "rating"
		case total = "total"
		case scale = "scale"
		case badge = "badge"
		case badgeText = "badgeText"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		unformattedRating = try values.decodeIfPresent(Double.self, forKey: .unformattedRating)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		scale = try values.decodeIfPresent(Int.self, forKey: .scale)
		badge = try values.decodeIfPresent(String.self, forKey: .badge)
		badgeText = try values.decodeIfPresent(String.self, forKey: .badgeText)
	}

}