//
//  DatePickerViewController.swift
//  SurveyNative
//
//  Created by Nora Mullaney on 1/31/17.
//  Copyright © 2017 Recovery Record. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet var datePickerView: UIDatePicker?

    var controllerDelegate: DatePickerViewControllerDelegate?
    var currentDate: Date? {
        didSet {
            datePickerView?.date = currentDate!
        }
    }
    var minDate: Date? {
        didSet {
            datePickerView?.minimumDate = minDate
        }
    }
    var maxDate: Date? {
        didSet {
            datePickerView?.maximumDate = maxDate
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        datePickerView?.date = currentDate ?? Date()
        datePickerView?.datePickerMode = UIDatePicker.Mode.date
        datePickerView?.minimumDate = minDate
        datePickerView?.maximumDate = maxDate

        if #available(iOS 13.4, *) {
            datePickerView?.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        setColors()
    }

    func setColors() {
        if #available(iOS 12.0, *) {
            if traitCollection.userInterfaceStyle == .dark {
                datePickerView?.backgroundColor = UIColor.black
            } else {
                datePickerView?.backgroundColor = UIColor.white
            }
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setColors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doneTapped(_ sender: UIButton) {
        controllerDelegate?.onDone(selectedDate: datePickerView?.date)
    }
}

public protocol DatePickerViewControllerDelegate : NSObjectProtocol {
    func onDone(selectedDate: Date?);
}
