//
//  ImageCacheKey.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 12/07/21.
//

import SwiftUI

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
