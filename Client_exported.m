classdef Client_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        Button                 matlab.ui.control.StateButton
        Button_1               matlab.ui.control.StateButton
        Button_2               matlab.ui.control.StateButton
        Button_3               matlab.ui.control.StateButton
        Button_4               matlab.ui.control.StateButton
        Button_5               matlab.ui.control.StateButton
        Button_6               matlab.ui.control.StateButton
        Button_7               matlab.ui.control.StateButton
        Button_8               matlab.ui.control.StateButton
        Button_9               matlab.ui.control.StateButton
        Button_10              matlab.ui.control.StateButton
        Button_11              matlab.ui.control.StateButton
        Button_12              matlab.ui.control.StateButton
        Button_13              matlab.ui.control.StateButton
        Button_14              matlab.ui.control.StateButton
        Button_15              matlab.ui.control.StateButton
        Button_16              matlab.ui.control.StateButton
        Button_17              matlab.ui.control.StateButton
        Button_18              matlab.ui.control.StateButton
        Button_19              matlab.ui.control.StateButton
        Image                  matlab.ui.control.Image
        DropButton             matlab.ui.control.Button
        Button_20              matlab.ui.control.StateButton
        Button_21              matlab.ui.control.StateButton
        Button_22              matlab.ui.control.StateButton
        TakeButton             matlab.ui.control.Button
        Image_2                matlab.ui.control.Image
        Image_3                matlab.ui.control.Image
        Image2                 matlab.ui.control.Image
        EditField_1            matlab.ui.control.NumericEditField
        Image2_2               matlab.ui.control.Image
        EditField_2            matlab.ui.control.NumericEditField
        Label                  matlab.ui.control.Label
        Label_1                matlab.ui.control.Label
        Label_2                matlab.ui.control.Label
        SCOREEditField_3Label  matlab.ui.control.Label
        SCOREEditField         matlab.ui.control.NumericEditField
        SCOREEditField_4Label  matlab.ui.control.Label
        SCOREEditField_1       matlab.ui.control.NumericEditField
        SCOREEditField_5Label  matlab.ui.control.Label
        SCOREEditField_2       matlab.ui.control.NumericEditField
        Button_23              matlab.ui.control.StateButton
        Button_24              matlab.ui.control.StateButton
        Button_25              matlab.ui.control.StateButton
        Button_26              matlab.ui.control.StateButton
        Button_27              matlab.ui.control.StateButton
        Button_28              matlab.ui.control.StateButton
        Button_29              matlab.ui.control.StateButton
        Button_30              matlab.ui.control.StateButton
        Button_31              matlab.ui.control.StateButton
        Button_32              matlab.ui.control.StateButton
        Button_33              matlab.ui.control.StateButton
        Button_34              matlab.ui.control.StateButton
        Button_35              matlab.ui.control.StateButton
        Button_36              matlab.ui.control.StateButton
        Button_37              matlab.ui.control.StateButton
        Button_38              matlab.ui.control.StateButton
        Button_39              matlab.ui.control.StateButton
        Button_40              matlab.ui.control.StateButton
        Button_41              matlab.ui.control.StateButton
        Button_42              matlab.ui.control.StateButton
        PASSButton             matlab.ui.control.Button
        TIPButton              matlab.ui.control.Button
        OUTButton              matlab.ui.control.Button
        Lamp                   matlab.ui.control.Lamp
        Lamp_1                 matlab.ui.control.Lamp
        Lamp_2                 matlab.ui.control.Lamp
    end

    
    properties (Access = private)
        holdSlot % Description
        extraSlot
        outSlot
        toOut
        takeDizhu = 0
        cardsHolded % Description
        outIndicator = 0
    end
    
    methods (Access = private)
        
        function moveUp(app, staff)
            staff.Position = staff.Position + [0, 20, 0, 0];
        end
        function moveDown(app, staff)
            staff.Position = staff.Position - [0, 20, 0, 0];
        end
        
        function ret = checkValidCore(app)
            % more policy to add, currently out randomly
            ret = ~isempty(app.toOut);
        end
        function checkValid(app, idx)
%             app.toOut = [app.toOut, app.cardsHolded(idx)];
            app.toOut = [];
            indent = floor((length(app.holdSlot) - length(app.cardsHolded))/2);
            for idx = 1:length(app.cardsHolded)
                %assert(app.holdSlot(idx+indent).Visible == true)
                if (app.holdSlot(idx+indent).Value)
                    app.toOut = [app.toOut, app.cardsHolded(idx)];
                end
            end
            if (checkValidCore(app))
                % Here more policy to added
                app.OUTButton.Enable = true;
            else
                app.OUTButton.Enable = false;
            end
        end
    end
    
    methods (Access = public)
        
        function results = initialize(app, cards)
            app.holdSlot = [app.Button, app.Button_1, app.Button_2, app.Button_3, app.Button_4, app.Button_5, app.Button_6, app.Button_7, app.Button_8, app.Button_9, app.Button_10, app.Button_11, app.Button_12, app.Button_13, app.Button_14, app.Button_15, app.Button_16, app.Button_17, app.Button_18, app.Button_19];
            app.extraSlot = [app.Button_20, app.Button_21, app.Button_22];
            app.outSlot = [app.Button_23, app.Button_24, app.Button_25, app.Button_26, app.Button_27, app.Button_28, app.Button_29, app.Button_30, app.Button_31, app.Button_32, app.Button_33, app.Button_34, app.Button_35, app.Button_36, app.Button_37, app.Button_38, app.Button_39, app.Button_40, app.Button_41, app.Button_42];
            app.updateCards(cards, "hold");
        end
        function output = runForDizhu(app)
            app.DropButton.Visible = true;
            app.TakeButton.Visible = true;
            while (app.takeDizhu == 0)
                pause(0.01) % 10ms pin
            end
            output = app.takeDizhu;
            return
        end
        function updateCards(app, cards, flag)       
            if (flag == "extra")
                slotCapacity = 3;
                toShow = app.extraSlot;
            elseif (flag == "out")
                toShow = app.outSlot;
                slotCapacity = 20;
            else
                toShow = app.holdSlot;
                slotCapacity = 20;
                app.cardsHolded = cards;
            end
            numberOfCard = length(cards);
            indent = floor((slotCapacity - numberOfCard)/2);
            for idx = 1:slotCapacity
                if (toShow(idx).Value == true)
                    toShow(idx).Value = false;
                    app.moveDown(toShow(idx))
                end
                if (idx <= indent || idx > numberOfCard+indent)
                    toShow(idx).Visible = false;
                else
                    toShow(idx).Visible = true;
                    toShow(idx).Icon = cards(idx-indent).Icon;
                end
            end
        end
        function outCards = myTurn(app)
            while (app.outIndicator == 0)
                pause(0.01) % 10ms pin
            end
            if (app.outIndicator == 1)
                outCards = app.toOut;
            else
                outCards = [];
            end            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: Button
        function ButtonValueChanged(app, event)
            value = app.Button.Value;
            idx = 1;
            if (value)
                app.moveUp(app.Button)
                %app.Button.Position
            else
                app.moveDown(app.Button)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_1
        function Button_1ValueChanged(app, event)
            value = app.Button_1.Value;
            idx = 2;
            if (value)
                app.moveUp(app.Button_1)
                %app.Button.Position
            else
                app.moveDown(app.Button_1)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_2
        function Button_2ValueChanged(app, event)
            value = app.Button_2.Value;
            idx = 3;
            if (value)
                app.moveUp(app.Button_2)
                %app.Button.Position
            else
                app.moveDown(app.Button_2)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_3
        function Button_3ValueChanged(app, event)
            value = app.Button_3.Value;
            idx = 4;
            if (value)
                app.moveUp(app.Button_3)
                %app.Button.Position
            else
                app.moveDown(app.Button_3)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_4
        function Button_4ValueChanged(app, event)
            value = app.Button_4.Value;
            idx = 5;
            if (value)
                app.moveUp(app.Button_4)
                %app.Button.Position
            else
                app.moveDown(app.Button_4)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_5
        function Button_5ValueChanged(app, event)
            value = app.Button_5.Value;
            idx = 6;
            if (value)
                app.moveUp(app.Button_5)
                %app.Button.Position
            else
                app.moveDown(app.Button_5)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_6
        function Button_6ValueChanged(app, event)
            value = app.Button_6.Value;
            idx = 7;
            if (value)
                app.moveUp(app.Button_6)
                %app.Button.Position
            else
                app.moveDown(app.Button_6)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_7
        function Button_7ValueChanged(app, event)
            value = app.Button_7.Value;
            idx = 8;
            if (value)
                app.moveUp(app.Button_7)
                %app.Button.Position
            else
                app.moveDown(app.Button_7)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_8
        function Button_8ValueChanged(app, event)
            value = app.Button_8.Value;
            idx = 9;
            if (value)
                app.moveUp(app.Button_8)
                %app.Button.Position
            else
                app.moveDown(app.Button_8)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_9
        function Button_9ValueChanged(app, event)
            value = app.Button_9.Value;
            idx = 10;
            if (value)
                app.moveUp(app.Button_9)
                %app.Button.Position
            else
                app.moveDown(app.Button_9)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_10
        function Button_10ValueChanged(app, event)
            value = app.Button_10.Value;
            idx = 11;
            if (value)
                app.moveUp(app.Button_10)
                %app.Button.Position
            else
                app.moveDown(app.Button_10)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_11
        function Button_11ValueChanged(app, event)
            value = app.Button_11.Value;
            idx = 12;
            if (value)
                app.moveUp(app.Button_11)
                %app.Button.Position
            else
                app.moveDown(app.Button_11)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_12
        function Button_12ValueChanged(app, event)
            value = app.Button_12.Value;
            idx = 13;
            if (value)
                app.moveUp(app.Button_12)
                %app.Button.Position
            else
                app.moveDown(app.Button_12)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_13
        function Button_13ValueChanged(app, event)
            value = app.Button_13.Value;
            idx = 14;
            if (value)
                app.moveUp(app.Button_13)
                %app.Button.Position
            else
                app.moveDown(app.Button_13)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_14
        function Button_14ValueChanged(app, event)
            value = app.Button_14.Value;
            idx = 15;
            if (value)
                app.moveUp(app.Button_14)
                %app.Button.Position
            else
                app.moveDown(app.Button_14)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_15
        function Button_15ValueChanged(app, event)
            value = app.Button_15.Value;
            idx = 16;
            if (value)
                app.moveUp(app.Button_15)
                %app.Button.Position
            else
                app.moveDown(app.Button_15)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_16
        function Button_16ValueChanged(app, event)
            value = app.Button_16.Value;
            idx = 17;
            if (value)
                app.moveUp(app.Button_16)
                %app.Button.Position
            else
                app.moveDown(app.Button_16)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_17
        function Button_17ValueChanged(app, event)
            value = app.Button_17.Value;
            idx = 18;
            if (value)
                app.moveUp(app.Button_17)
                %app.Button.Position
            else
                app.moveDown(app.Button_17)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_18
        function Button_18ValueChanged(app, event)
            value = app.Button_18.Value;
            idx = 19;
            if (value)
                app.moveUp(app.Button_18)
                %app.Button.Position
            else
                app.moveDown(app.Button_18)
            end
            app.checkValid(idx);
        end

        % Value changed function: Button_19
        function Button_19ValueChanged(app, event)
            value = app.Button_19.Value;
            idx = 20;
            if (value)
                app.moveUp(app.Button_19)
                %app.Button.Position
            else
                app.moveDown(app.Button_19)
            end
            app.checkValid(idx);
        end

        % Button pushed function: DropButton
        function DropButtonPushed(app, event)
            app.takeDizhu = -1;
            app.TakeButton.Visible = false;
            app.DropButton.Visible = false;
        end

        % Button pushed function: TakeButton
        function TakeButtonPushed(app, event)
            app.takeDizhu = 1;
            app.TakeButton.Visible = false;
            app.DropButton.Visible = false;
        end

        % Button pushed function: OUTButton
        function OUTButtonPushed(app, event)
            app.OUTButton.Enable = false;
            app.outIndicator = 1;
        end

        % Button pushed function: PASSButton
        function PASSButtonPushed(app, event)
            app.outIndicator = -1;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 833 693];
            app.UIFigure.Name = 'UI Figure';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'state');
            app.Button.ValueChangedFcn = createCallbackFcn(app, @ButtonValueChanged, true);
            app.Button.Text = '';
            app.Button.Position = [168 68 66 91];

            % Create Button_1
            app.Button_1 = uibutton(app.UIFigure, 'state');
            app.Button_1.ValueChangedFcn = createCallbackFcn(app, @Button_1ValueChanged, true);
            app.Button_1.Text = '';
            app.Button_1.Position = [195 68 66 91];

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'state');
            app.Button_2.ValueChangedFcn = createCallbackFcn(app, @Button_2ValueChanged, true);
            app.Button_2.Text = '';
            app.Button_2.Position = [224 68 66 91];

            % Create Button_3
            app.Button_3 = uibutton(app.UIFigure, 'state');
            app.Button_3.ValueChangedFcn = createCallbackFcn(app, @Button_3ValueChanged, true);
            app.Button_3.Text = '';
            app.Button_3.Position = [251 68 66 91];

            % Create Button_4
            app.Button_4 = uibutton(app.UIFigure, 'state');
            app.Button_4.ValueChangedFcn = createCallbackFcn(app, @Button_4ValueChanged, true);
            app.Button_4.Text = '';
            app.Button_4.Position = [280 68 66 91];

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'state');
            app.Button_5.ValueChangedFcn = createCallbackFcn(app, @Button_5ValueChanged, true);
            app.Button_5.Text = '';
            app.Button_5.Position = [307 68 66 91];

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'state');
            app.Button_6.ValueChangedFcn = createCallbackFcn(app, @Button_6ValueChanged, true);
            app.Button_6.Text = '';
            app.Button_6.Position = [336 68 66 91];

            % Create Button_7
            app.Button_7 = uibutton(app.UIFigure, 'state');
            app.Button_7.ValueChangedFcn = createCallbackFcn(app, @Button_7ValueChanged, true);
            app.Button_7.Text = '';
            app.Button_7.Position = [363 68 66 91];

            % Create Button_8
            app.Button_8 = uibutton(app.UIFigure, 'state');
            app.Button_8.ValueChangedFcn = createCallbackFcn(app, @Button_8ValueChanged, true);
            app.Button_8.Text = '';
            app.Button_8.Position = [392 68 66 91];

            % Create Button_9
            app.Button_9 = uibutton(app.UIFigure, 'state');
            app.Button_9.ValueChangedFcn = createCallbackFcn(app, @Button_9ValueChanged, true);
            app.Button_9.Text = '';
            app.Button_9.Position = [419 68 66 91];

            % Create Button_10
            app.Button_10 = uibutton(app.UIFigure, 'state');
            app.Button_10.ValueChangedFcn = createCallbackFcn(app, @Button_10ValueChanged, true);
            app.Button_10.Text = '';
            app.Button_10.Position = [448 68 66 91];

            % Create Button_11
            app.Button_11 = uibutton(app.UIFigure, 'state');
            app.Button_11.ValueChangedFcn = createCallbackFcn(app, @Button_11ValueChanged, true);
            app.Button_11.Text = '';
            app.Button_11.Position = [475 68 66 91];

            % Create Button_12
            app.Button_12 = uibutton(app.UIFigure, 'state');
            app.Button_12.ValueChangedFcn = createCallbackFcn(app, @Button_12ValueChanged, true);
            app.Button_12.Text = '';
            app.Button_12.Position = [504 68 66 91];

            % Create Button_13
            app.Button_13 = uibutton(app.UIFigure, 'state');
            app.Button_13.ValueChangedFcn = createCallbackFcn(app, @Button_13ValueChanged, true);
            app.Button_13.Text = '';
            app.Button_13.Position = [531 68 66 91];

            % Create Button_14
            app.Button_14 = uibutton(app.UIFigure, 'state');
            app.Button_14.ValueChangedFcn = createCallbackFcn(app, @Button_14ValueChanged, true);
            app.Button_14.Text = '';
            app.Button_14.Position = [560 68 66 91];

            % Create Button_15
            app.Button_15 = uibutton(app.UIFigure, 'state');
            app.Button_15.ValueChangedFcn = createCallbackFcn(app, @Button_15ValueChanged, true);
            app.Button_15.Text = '';
            app.Button_15.Position = [587 68 66 91];

            % Create Button_16
            app.Button_16 = uibutton(app.UIFigure, 'state');
            app.Button_16.ValueChangedFcn = createCallbackFcn(app, @Button_16ValueChanged, true);
            app.Button_16.Text = '';
            app.Button_16.Position = [616 68 66 91];

            % Create Button_17
            app.Button_17 = uibutton(app.UIFigure, 'state');
            app.Button_17.ValueChangedFcn = createCallbackFcn(app, @Button_17ValueChanged, true);
            app.Button_17.Text = '';
            app.Button_17.Position = [643 68 66 91];

            % Create Button_18
            app.Button_18 = uibutton(app.UIFigure, 'state');
            app.Button_18.ValueChangedFcn = createCallbackFcn(app, @Button_18ValueChanged, true);
            app.Button_18.Text = '';
            app.Button_18.Position = [672 68 66 91];

            % Create Button_19
            app.Button_19 = uibutton(app.UIFigure, 'state');
            app.Button_19.ValueChangedFcn = createCallbackFcn(app, @Button_19ValueChanged, true);
            app.Button_19.Text = '';
            app.Button_19.Position = [699 68 66 91];

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [69 63 100 100];

            % Create DropButton
            app.DropButton = uibutton(app.UIFigure, 'push');
            app.DropButton.ButtonPushedFcn = createCallbackFcn(app, @DropButtonPushed, true);
            app.DropButton.FontSize = 20;
            app.DropButton.Visible = 'off';
            app.DropButton.Position = [172 185 91 41];
            app.DropButton.Text = 'Drop';

            % Create Button_20
            app.Button_20 = uibutton(app.UIFigure, 'state');
            app.Button_20.Icon = '0.jpg';
            app.Button_20.Text = '';
            app.Button_20.Position = [397 555 41 56];

            % Create Button_21
            app.Button_21 = uibutton(app.UIFigure, 'state');
            app.Button_21.Icon = '0.jpg';
            app.Button_21.Text = '';
            app.Button_21.Position = [354 555 41 56];

            % Create Button_22
            app.Button_22 = uibutton(app.UIFigure, 'state');
            app.Button_22.Icon = '0.jpg';
            app.Button_22.Text = '';
            app.Button_22.Position = [437 555 41 56];

            % Create TakeButton
            app.TakeButton = uibutton(app.UIFigure, 'push');
            app.TakeButton.ButtonPushedFcn = createCallbackFcn(app, @TakeButtonPushed, true);
            app.TakeButton.FontSize = 20;
            app.TakeButton.Visible = 'off';
            app.TakeButton.Position = [285 185 91 41];
            app.TakeButton.Text = 'Take!';

            % Create Image_2
            app.Image_2 = uiimage(app.UIFigure);
            app.Image_2.Position = [69 533 100 100];

            % Create Image_3
            app.Image_3 = uiimage(app.UIFigure);
            app.Image_3.Position = [682 533 100 100];

            % Create Image2
            app.Image2 = uiimage(app.UIFigure);
            app.Image2.Position = [88 437 62 89];
            app.Image2.ImageSource = '0.jpg';

            % Create EditField_1
            app.EditField_1 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_1.Editable = 'off';
            app.EditField_1.FontSize = 20;
            app.EditField_1.FontColor = [0 0.4471 0.7412];
            app.EditField_1.Position = [102 463 35 35];
            app.EditField_1.Value = 17;

            % Create Image2_2
            app.Image2_2 = uiimage(app.UIFigure);
            app.Image2_2.Position = [699 436 62 89];
            app.Image2_2.ImageSource = '0.jpg';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_2.Editable = 'off';
            app.EditField_2.FontSize = 20;
            app.EditField_2.FontColor = [0 0.4471 0.7412];
            app.EditField_2.Position = [713 462 35 35];
            app.EditField_2.Value = 17;

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.FontSize = 20;
            app.Label.FontWeight = 'bold';
            app.Label.FontColor = [0.851 0.3255 0.098];
            app.Label.Position = [69 195 123 31];

            % Create Label_1
            app.Label_1 = uilabel(app.UIFigure);
            app.Label_1.FontSize = 20;
            app.Label_1.FontWeight = 'bold';
            app.Label_1.FontColor = [0.851 0.3255 0.098];
            app.Label_1.Position = [172 593 122 31];

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.FontSize = 20;
            app.Label_2.FontWeight = 'bold';
            app.Label_2.FontColor = [0.851 0.3255 0.098];
            app.Label_2.Position = [558 593 124 31];

            % Create SCOREEditField_3Label
            app.SCOREEditField_3Label = uilabel(app.UIFigure);
            app.SCOREEditField_3Label.HorizontalAlignment = 'right';
            app.SCOREEditField_3Label.Position = [69 164 48 22];
            app.SCOREEditField_3Label.Text = 'SCORE';

            % Create SCOREEditField
            app.SCOREEditField = uieditfield(app.UIFigure, 'numeric');
            app.SCOREEditField.Editable = 'off';
            app.SCOREEditField.HorizontalAlignment = 'center';
            app.SCOREEditField.Position = [125 164 33 22];

            % Create SCOREEditField_4Label
            app.SCOREEditField_4Label = uilabel(app.UIFigure);
            app.SCOREEditField_4Label.HorizontalAlignment = 'right';
            app.SCOREEditField_4Label.Position = [172 572 48 22];
            app.SCOREEditField_4Label.Text = 'SCORE';

            % Create SCOREEditField_1
            app.SCOREEditField_1 = uieditfield(app.UIFigure, 'numeric');
            app.SCOREEditField_1.Editable = 'off';
            app.SCOREEditField_1.HorizontalAlignment = 'center';
            app.SCOREEditField_1.Position = [228 572 33 22];

            % Create SCOREEditField_5Label
            app.SCOREEditField_5Label = uilabel(app.UIFigure);
            app.SCOREEditField_5Label.HorizontalAlignment = 'right';
            app.SCOREEditField_5Label.Position = [558 572 48 22];
            app.SCOREEditField_5Label.Text = 'SCORE';

            % Create SCOREEditField_2
            app.SCOREEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.SCOREEditField_2.Editable = 'off';
            app.SCOREEditField_2.HorizontalAlignment = 'center';
            app.SCOREEditField_2.Position = [614 572 33 22];

            % Create Button_23
            app.Button_23 = uibutton(app.UIFigure, 'state');
            app.Button_23.Text = '';
            app.Button_23.Position = [121 302 66 91];

            % Create Button_24
            app.Button_24 = uibutton(app.UIFigure, 'state');
            app.Button_24.Text = '';
            app.Button_24.Position = [148 302 66 91];

            % Create Button_25
            app.Button_25 = uibutton(app.UIFigure, 'state');
            app.Button_25.Text = '';
            app.Button_25.Position = [177 302 66 91];

            % Create Button_26
            app.Button_26 = uibutton(app.UIFigure, 'state');
            app.Button_26.Text = '';
            app.Button_26.Position = [204 302 66 91];

            % Create Button_27
            app.Button_27 = uibutton(app.UIFigure, 'state');
            app.Button_27.Text = '';
            app.Button_27.Position = [233 302 66 91];

            % Create Button_28
            app.Button_28 = uibutton(app.UIFigure, 'state');
            app.Button_28.Text = '';
            app.Button_28.Position = [260 302 66 91];

            % Create Button_29
            app.Button_29 = uibutton(app.UIFigure, 'state');
            app.Button_29.Text = '';
            app.Button_29.Position = [289 302 66 91];

            % Create Button_30
            app.Button_30 = uibutton(app.UIFigure, 'state');
            app.Button_30.Text = '';
            app.Button_30.Position = [316 302 66 91];

            % Create Button_31
            app.Button_31 = uibutton(app.UIFigure, 'state');
            app.Button_31.Text = '';
            app.Button_31.Position = [345 302 66 91];

            % Create Button_32
            app.Button_32 = uibutton(app.UIFigure, 'state');
            app.Button_32.Text = '';
            app.Button_32.Position = [372 302 66 91];

            % Create Button_33
            app.Button_33 = uibutton(app.UIFigure, 'state');
            app.Button_33.Text = '';
            app.Button_33.Position = [401 302 66 91];

            % Create Button_34
            app.Button_34 = uibutton(app.UIFigure, 'state');
            app.Button_34.Text = '';
            app.Button_34.Position = [428 302 66 91];

            % Create Button_35
            app.Button_35 = uibutton(app.UIFigure, 'state');
            app.Button_35.Text = '';
            app.Button_35.Position = [457 302 66 91];

            % Create Button_36
            app.Button_36 = uibutton(app.UIFigure, 'state');
            app.Button_36.Text = '';
            app.Button_36.Position = [484 302 66 91];

            % Create Button_37
            app.Button_37 = uibutton(app.UIFigure, 'state');
            app.Button_37.Text = '';
            app.Button_37.Position = [513 302 66 91];

            % Create Button_38
            app.Button_38 = uibutton(app.UIFigure, 'state');
            app.Button_38.Text = '';
            app.Button_38.Position = [540 302 66 91];

            % Create Button_39
            app.Button_39 = uibutton(app.UIFigure, 'state');
            app.Button_39.Text = '';
            app.Button_39.Position = [569 302 66 91];

            % Create Button_40
            app.Button_40 = uibutton(app.UIFigure, 'state');
            app.Button_40.Text = '';
            app.Button_40.Position = [596 302 66 91];

            % Create Button_41
            app.Button_41 = uibutton(app.UIFigure, 'state');
            app.Button_41.Text = '';
            app.Button_41.Position = [625 302 66 91];

            % Create Button_42
            app.Button_42 = uibutton(app.UIFigure, 'state');
            app.Button_42.Text = '';
            app.Button_42.Position = [652 302 66 91];

            % Create PASSButton
            app.PASSButton = uibutton(app.UIFigure, 'push');
            app.PASSButton.ButtonPushedFcn = createCallbackFcn(app, @PASSButtonPushed, true);
            app.PASSButton.BackgroundColor = [0 0.4471 0.7412];
            app.PASSButton.FontSize = 30;
            app.PASSButton.FontWeight = 'bold';
            app.PASSButton.FontAngle = 'italic';
            app.PASSButton.FontColor = [1 1 0];
            app.PASSButton.Position = [233 181 100 48];
            app.PASSButton.Text = 'PASS';

            % Create TIPButton
            app.TIPButton = uibutton(app.UIFigure, 'push');
            app.TIPButton.BackgroundColor = [0.4667 0.6745 0.1882];
            app.TIPButton.FontSize = 30;
            app.TIPButton.FontWeight = 'bold';
            app.TIPButton.FontAngle = 'italic';
            app.TIPButton.FontColor = [1 1 0];
            app.TIPButton.Position = [368 181 100 48];
            app.TIPButton.Text = 'TIP';

            % Create OUTButton
            app.OUTButton = uibutton(app.UIFigure, 'push');
            app.OUTButton.ButtonPushedFcn = createCallbackFcn(app, @OUTButtonPushed, true);
            app.OUTButton.BackgroundColor = [0 0.4471 0.7412];
            app.OUTButton.FontSize = 30;
            app.OUTButton.FontWeight = 'bold';
            app.OUTButton.FontAngle = 'italic';
            app.OUTButton.FontColor = [1 1 0];
            app.OUTButton.Enable = 'off';
            app.OUTButton.Position = [504 181 100 48];
            app.OUTButton.Text = 'OUT';

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Visible = 'off';
            app.Lamp.Position = [135 195 34 34];

            % Create Lamp_1
            app.Lamp_1 = uilamp(app.UIFigure);
            app.Lamp_1.Visible = 'off';
            app.Lamp_1.Position = [639 492 34 34];

            % Create Lamp_2
            app.Lamp_2 = uilamp(app.UIFigure);
            app.Lamp_2.Visible = 'off';
            app.Lamp_2.Position = [177 491 34 34];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Client_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end