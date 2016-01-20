function(doc) {
  if (doc.type == todo) {
    emit(doc.priority, doc);
  }
};