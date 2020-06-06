//
//  PlantTodayViewListRow.swift
//  Agronomist
//
//  Created by Ryan Thally on 6/5/20.
//  Copyright © 2020 Ryan Thally. All rights reserved.
//

import SwiftUI
import CoreData

struct PlantTodayViewListRow: View {
    var plant: Plant
    
    private let dateFormatter: DateIntervalFormatter = {
        let dif = DateIntervalFormatter()
        
        dif.dateStyle = .full
        
        return dif
    }()
    
    var lastWateredText: String {
        if let lastWaterLog = plant.waterLogArray.first {
            let interval = DateInterval(start: Date(), end: lastWaterLog.wrappedDate)
            return "Watered \(String(describing: dateFormatter.string(from: interval)))"
        } else {
            return "Not watered yet."
        }
            
    }
    
    var body: some View {
        HStack {
            WaterIcon()
                .frame(width: iconSize, height: iconSize)
            VStack(alignment: .leading) {
                Text(self.plant.wrappedName)
                Text(self.lastWateredText)
            }
        }.frame(minWidth: .zero, maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: Drawing Contstants
    let iconSize: CGFloat = 35
}

struct PlantTodayViewListRow_Previews: PreviewProvider {
    static var previews: some View {
        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        let plant = Plant(context: moc)
        
        plant.id = UUID()
        plant.name = "My Plant"
        
        let waterLog = WaterLog(context: moc)
        waterLog.date = Date(timeIntervalSinceNow: -345600)
        
        plant.addToWaterLogs(waterLog)
        
        
        return PlantTodayViewListRow(plant: plant)
    }
}