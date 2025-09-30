
import SwiftUI

struct SliderTickDemo: View {
    @State private var value: Float = 5.0

    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Slider Ticks Demo")
                    .font(.title3)
                    .fontWeight(.bold)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Basic")
                        .font(.headline)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Display ticks automatically when initializing a `Slider` with the `step` parameter.")
                        Text("**NOTE**: For iOS, it has to be an initializer that accept a `label` parameter as well.")
                        Text("            Otherwise, the ticks won't show up.")
                    }
                    .foregroundStyle(.secondary)
                    .font(.subheadline)


                    Slider(value: $value, in: 0.0...10.0, step: 1.0, label: {})
                }
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Little Customization")
                        .font(.headline)

                    Text("Basic Labels")
                        .font(.subheadline)
                    Slider(value: $value, in: 0.0...10.0, step: 1.0, label: {}, tick: {
                        value in
                        SliderTick(value, label: {
                            Text(String(format: "%.0f", value))
                        })
                    })
                    
                
                    
                    Text("Critical Value Only")
                        .font(.subheadline)
                    Slider(value: $value, in: 0.0...10.0, step: 1.0, label: {}, tick: {
                        value in
                        if Float(Int(value)) == value, Int(value) % 5 == 0 {
                            return SliderTick(value, label: {
                                Text(String(format: "%.0f", value))
                            })
                        } else {
                            return nil
                        }
                    })
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("DO NOT DO")
                        .font(.headline)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("**DO NOT** Display ticks dynamically based on some state variable.")
                        Text("`SliderTickBuilder` will not be re-called on those state changes.")
                        Text("Ex: `.foregroundStyle(value == self.value ? .red : .primary)`")
                    }
                    .foregroundStyle(.secondary)
                    .font(.subheadline)

                    Slider(value: $value, in: 0.0...10.0, step: 1.0, label: {}, tick: {
                        value in
                        SliderTick(value, label: {
                            Text(String(format: "%.0f", value))
                                .foregroundStyle(value == self.value ? .red : .primary)
                        })
                    })
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
