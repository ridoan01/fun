//
//  Scheduler.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import Foundation
import Combine

final class Scheduler{
	static var backgroundWorkScheduler : OperationQueue = {
		let operationQueue = OperationQueue()
		operationQueue.maxConcurrentOperationCount = 5
		operationQueue.qualityOfService = QualityOfService.userInitiated
		return operationQueue
	}()
	
	static let mainScheduler = RunLoop.main
}
