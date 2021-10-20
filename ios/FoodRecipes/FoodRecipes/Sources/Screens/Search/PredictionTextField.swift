//
//  PredictionTextField.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 20/10/21.
//

import SwiftUI

	// TextField capable of making predictions based on provided predictable values
struct PredictingTextField: View {
	
		/// All possible predictable values. Can be only one.
	@Binding var predictableValues: Array<String>
	
		/// This returns the values that are being predicted based on the predictable values
	@Binding var predictedValues: Array<String>
	
		/// Current input of the user in the TextField. This is Binded as perhaps there is the urge to alter this during live time. E.g. when a predicted value was selected and the input should be cleared
	@Binding var textFieldInput: String
	
		/// The time interval between predictions based on current input. Default is 0.1 second. I would not recommend setting this to low as it can be CPU heavy.
	@State var predictionInterval: Double?
	
		/// Placeholder in empty TextField
	@State var textFieldTitle: String?
	
	@State private var isBeingEdited: Bool = false
	
	init(predictableValues: Binding<Array<String>>, predictedValues: Binding<Array<String>>, textFieldInput: Binding<String>, textFieldTitle: String? = "", predictionInterval: Double? = 0.1){
		
		self._predictableValues = predictableValues
		self._predictedValues = predictedValues
		self._textFieldInput = textFieldInput
		
		self.textFieldTitle = textFieldTitle
		self.predictionInterval = predictionInterval
	}
	
	var body: some View {
		
		HStack(alignment: .center, spacing: 10){
			Image(systemName: "magnifyingglass")
				.resizable()
				.frame(width: 20, height: 20, alignment: .center)
				.padding(4)
				.foregroundColor(Color(UIColor.tertiaryLabel))
			
			TextField(self.textFieldTitle ?? "Search",
					  text: self.$textFieldInput,
					  onEditingChanged: { editing in self.realTimePrediction(status: editing)},
					  onCommit: { self.makePrediction()})
			
			
		}
		.padding(.vertical, 4)
		.padding(.horizontal, 6)
		.background(Color(UIColor.secondarySystemBackground).opacity(0.8))
		.cornerRadius(8)
			//		.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(UIColor.tertiaryLabel), lineWidth: 1))
		
	}
	
		/// Schedules prediction based on interval and only a if input is being made
	private func realTimePrediction(status: Bool) {
		self.isBeingEdited = status
		if status == true {
			Timer.scheduledTimer(withTimeInterval: self.predictionInterval ?? 1, repeats: true) { timer in
				self.makePrediction()
				
				if self.isBeingEdited == false {
					timer.invalidate()
				}
			}
		}
	}
	
		/// Capitalizes the first letter of a String
	private func capitalizeFirstLetter(smallString: String) -> String {
		return smallString.prefix(1).capitalized + smallString.dropFirst()
	}
	
		/// Makes prediciton based on current input
	private func makePrediction() {
		self.predictedValues = []
		if !self.textFieldInput.isEmpty{
			for value in self.predictableValues {
				if self.textFieldInput.split(separator: " ").count > 1 {
					self.makeMultiPrediction(value: value)
				}else {
					if value.contains(self.textFieldInput) || value.contains(self.capitalizeFirstLetter(smallString: self.textFieldInput)){
						if !self.predictedValues.contains(String(value)) {
							self.predictedValues.append(String(value))
						}
					}
				}
			}
		}
	}
	
		/// Makes predictions if the input String is splittable
	private func makeMultiPrediction(value: String) {
		for subString in self.textFieldInput.split(separator: " ") {
			if value.contains(String(subString)) || value.contains(self.capitalizeFirstLetter(smallString: String(subString))){
				if !self.predictedValues.contains(value) {
					self.predictedValues.append(value)
				}
			}
		}
	}
}
