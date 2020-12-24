/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Address : Codable {
	let streetAddress : String?
	let extendedAddress : String?
	let locality : String?
	let postalCode : String?
	let region : String?
	let countryName : String?
	let countryCode : String?
	let obfuscate : Bool?

	enum CodingKeys: String, CodingKey {

		case streetAddress = "streetAddress"
		case extendedAddress = "extendedAddress"
		case locality = "locality"
		case postalCode = "postalCode"
		case region = "region"
		case countryName = "countryName"
		case countryCode = "countryCode"
		case obfuscate = "obfuscate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		streetAddress = try values.decodeIfPresent(String.self, forKey: .streetAddress)
		extendedAddress = try values.decodeIfPresent(String.self, forKey: .extendedAddress)
		locality = try values.decodeIfPresent(String.self, forKey: .locality)
		postalCode = try values.decodeIfPresent(String.self, forKey: .postalCode)
		region = try values.decodeIfPresent(String.self, forKey: .region)
		countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
		countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
		obfuscate = try values.decodeIfPresent(Bool.self, forKey: .obfuscate)
	}

}