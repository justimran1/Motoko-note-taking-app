import Array "mo:base/Array";
actor NotesApp {
    stable var notes : [Text] = [];

    // Add a new note
    public func addNote(note : Text) : async () {
        notes := Array.append(notes, [note]);
    };

    // Get all notes
    public query func getNotes() : async [Text] {
        return notes;
    };

    // Delete a note (by index)
    public func deleteNote(index : Nat) : async () {
        if (index < Array.size(notes)) {
            notes := Array.tabulate<Text>(Array.size(notes) - 1, func(i) {
                if (i < index) { notes[i] } else { notes[i + 1] }
            });
        }
    };
}
