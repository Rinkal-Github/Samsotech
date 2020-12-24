/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Pagination : Codable {
	let currentPage : Int?
	let pageGroup : String?
	let nextPageStartIndex : Int?
	let nextPageNumber : Int?
	let nextPageGroup : String?

	enum CodingKeys: String, CodingKey {

		case currentPage = "currentPage"
		case pageGroup = "pageGroup"
		case nextPageStartIndex = "nextPageStartIndex"
		case nextPageNumber = "nextPageNumber"
		case nextPageGroup = "nextPageGroup"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		currentPage = try values.decodeIfPresent(Int.self, forKey: .currentPage)
		pageGroup = try values.decodeIfPresent(String.self, forKey: .pageGroup)
		nextPageStartIndex = try values.decodeIfPresent(Int.self, forKey: .nextPageStartIndex)
		nextPageNumber = try values.decodeIfPresent(Int.self, forKey: .nextPageNumber)
		nextPageGroup = try values.decodeIfPresent(String.self, forKey: .nextPageGroup)
	}

}