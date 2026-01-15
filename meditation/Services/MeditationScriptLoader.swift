//
//  MeditationScriptLoader.swift
//  meditation
//
//  Bundled script seeding
//

import Foundation
import CoreData

private struct MeditationScriptPayload: Decodable {
    let id: UUID
    let title: String
    let category: String?
    let durationSeconds: Double
    let text: String
}

enum MeditationScriptSeeder {
    static func seedIfNeeded(context: NSManagedObjectContext) {
        guard shouldSeed(context: context) else { return }
        guard let scripts = loadBundledScripts() else { return }
        
        let now = Date()
        scripts.forEach { payload in
            let script = MeditationScript(context: context)
            script.id = payload.id
            script.title = payload.title
            script.category = payload.category
            script.durationSeconds = payload.durationSeconds
            script.text = payload.text
            script.isBundled = true
            script.createdAt = now
            script.updatedAt = now
        }
        
        do {
            try context.save()
        } catch {
            print("Error seeding meditation scripts: \(error)")
        }
    }
    
    private static func shouldSeed(context: NSManagedObjectContext) -> Bool {
        let request = MeditationScript.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "isBundled == YES")
        
        do {
            let count = try context.count(for: request)
            return count == 0
        } catch {
            print("Error checking for existing scripts: \(error)")
            return false
        }
    }
    
    private static func loadBundledScripts() -> [MeditationScriptPayload]? {
        guard let url = Bundle.main.url(forResource: "MeditationScripts", withExtension: "json") else {
            print("Bundled MeditationScripts.json not found in app bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([MeditationScriptPayload].self, from: data)
        } catch {
            print("Error decoding MeditationScripts.json: \(error)")
            return nil
        }
    }
}
