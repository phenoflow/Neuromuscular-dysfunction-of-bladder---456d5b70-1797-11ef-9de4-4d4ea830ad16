cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  functional-neuromuscular-dysfunction-of-bladder---primary:
    run: functional-neuromuscular-dysfunction-of-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  neuromuscular-dysfunction-of-bladder---primary:
    run: neuromuscular-dysfunction-of-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: functional-neuromuscular-dysfunction-of-bladder---primary/output
  neuromuscular-dysfunction-of-bladder-atony---primary:
    run: neuromuscular-dysfunction-of-bladder-atony---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: neuromuscular-dysfunction-of-bladder---primary/output
  neuropathic-neuromuscular-dysfunction-of-bladder---primary:
    run: neuropathic-neuromuscular-dysfunction-of-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: neuromuscular-dysfunction-of-bladder-atony---primary/output
  neuromuscular-dysfunction-of-bladder-instability---primary:
    run: neuromuscular-dysfunction-of-bladder-instability---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: neuropathic-neuromuscular-dysfunction-of-bladder---primary/output
  other-neuromuscular-dysfunction-of-bladder---primary:
    run: other-neuromuscular-dysfunction-of-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: neuromuscular-dysfunction-of-bladder-instability---primary/output
  neuromuscular-dysfunction-of-bladder-classified---primary:
    run: neuromuscular-dysfunction-of-bladder-classified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: other-neuromuscular-dysfunction-of-bladder---primary/output
  unstable-neuromuscular-dysfunction-of-bladder---primary:
    run: unstable-neuromuscular-dysfunction-of-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: neuromuscular-dysfunction-of-bladder-classified---primary/output
  neuromuscular-dysfunction-of-bladder-sphincter---primary:
    run: neuromuscular-dysfunction-of-bladder-sphincter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: unstable-neuromuscular-dysfunction-of-bladder---primary/output
  neuromuscular-dysfunction-of-bladder-unspecified---primary:
    run: neuromuscular-dysfunction-of-bladder-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: neuromuscular-dysfunction-of-bladder-sphincter---primary/output
  neurogenic-neuromuscular-dysfunction-of-bladder---primary:
    run: neurogenic-neuromuscular-dysfunction-of-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: neuromuscular-dysfunction-of-bladder-unspecified---primary/output
  atonic-neuromuscular-dysfunction-of-bladder---primary:
    run: atonic-neuromuscular-dysfunction-of-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: neurogenic-neuromuscular-dysfunction-of-bladder---primary/output
  bladder---primary:
    run: bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: atonic-neuromuscular-dysfunction-of-bladder---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: bladder---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
